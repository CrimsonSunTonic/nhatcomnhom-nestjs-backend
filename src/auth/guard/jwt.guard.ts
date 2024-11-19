import { ExecutionContext, Injectable, UnauthorizedException } from '@nestjs/common';
import { AuthGuard } from '@nestjs/passport';
import { Observable } from 'rxjs';

@Injectable()
export class JwtGuard extends AuthGuard('jwt') {
  constructor() {
    super();
  }
  
  handleRequest(err, user, info) {
    if (err || !user) {
      throw err || new UnauthorizedException("Access Token not exist!");
    }
    return user;
  }
}
