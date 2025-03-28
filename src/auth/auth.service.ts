import { ForbiddenException, Injectable } from "@nestjs/common";
import { PrismaService } from "src/prisma/prisma.service";
import { SignInDto, SignUpDto } from "./dto";
import * as argon from "argon2";
import { PrismaClientKnownRequestError } from "@prisma/client/runtime/library";
import { JwtService } from "@nestjs/jwt";
import { ConfigService } from "@nestjs/config";

@Injectable({})
export class AuthService {
  constructor(
    private prisma: PrismaService,
    private jwt: JwtService,
    private config: ConfigService,
  ) {

  }
  async signup(dto: SignUpDto) {
    //generate the password
    const hash = await argon.hash(dto.password);

    try {
      //save new user in db
      const user = await this.prisma.user.create({
        data: {
          email: dto.email,
          hash,
          firstname: dto.firstname,
          lastname: dto.lastname,
          role: dto.role,
        },
      });

      return this.signToken(user.id, user.email);
    } catch (error) {
      if (error instanceof PrismaClientKnownRequestError) {
        if (error.code == 'P2002') {
          throw new ForbiddenException(
            'Credentials taken',
          );
        }
      } else if (error.message.includes("Can't reach database server")) {
        throw new ForbiddenException(
          'Database is not ready. Please try again later.',
        );
      }
      throw error;
    }
  }

  async signin(dto: SignInDto) {
    // find the user by email
    const user = await this.prisma.user.findUnique({
      where: {
        email: dto.email,
      },
    });

    // if user does not exist throw exception
    if (!user) {
      throw new ForbiddenException(
        'Credentials incorrect',
      );
    };

    // compare password
    const pwMatches = await argon.verify(
      user.hash,
      dto.password,
    );

    // if password incorrect throw exception
    if (!pwMatches) {
      throw new ForbiddenException(
        'Credentials incorrect',
      );
    };

    return this.signToken(user.id, user.email);
  }

  async signToken(
    userId: number, 
    email: string,
  ): Promise<{access_token: string}> {
    const payload = {
      sub: userId,
      email,
    };

    const secret = this.config.get('JWT_SECRET');

    const token = await this.jwt.signAsync(payload, {
      expiresIn: '7d',
      secret: secret,
    });

    return {
      access_token: token,
    };
  }
}