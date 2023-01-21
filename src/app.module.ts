import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { PrismaService } from './database/prisma.service';
import { ClientModule } from './client/client.module';
import { TableModule } from './table/table.module';
import { MenuItemModule } from './menu-item/menu-item.module';
import { OrderModule } from './order/order.module';
import { WaiterModule } from './waiter/waiter.module';

@Module({
  controllers: [AppController],
  providers: [AppService, PrismaService],
  imports: [
    ClientModule,
    TableModule,
    MenuItemModule,
    OrderModule,
    WaiterModule,
  ],
})
export class AppModule {}
