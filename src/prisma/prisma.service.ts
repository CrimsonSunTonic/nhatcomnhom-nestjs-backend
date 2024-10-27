import { Injectable } from '@nestjs/common';
import { PrismaClient } from '@prisma/client';

@Injectable()
export class PrismaService extends PrismaClient {
  constructor() {
    super({
      datasources: {
        db :{
          url: 'postgresql://lsi:lsilsilsi@localhost:5432/lsi_kintaikanri'
        }
      }
    })
  }
}
