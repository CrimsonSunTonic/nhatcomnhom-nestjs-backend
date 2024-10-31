import { Body, Controller, Post, Get } from "@nestjs/common";
import { AuthService } from "./auth.service";
import { AuthDto } from "./dto";

@Controller('auth')
export class AuthController {
  constructor(private authService: AuthService) {}

  @Get('signin')
  getsignin() {
    return this.authService.getsignin()
  }

  @Get('signup')
  getsignup() {
    return this.authService.getsignup()
  }

  @Post('signup')
  signup(@Body() dto: AuthDto) {
    console.log({
      dto,
    })
    return this.authService.signup()
  }

  @Post('signin')
  signin() {
    return this.authService.signin()
  }

}