import { Controller, Get } from '@nestjs/common';
import { PrismaService } from 'src/database/prisma.service';

@Controller('client')
export class ClientController {
    @Get()
    getClient(): string {
      return 
    }
}
