import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';

async function AppMain() {
  const app = await NestFactory.create(AppModule);
  await app.listen(7408);
}
AppMain();
