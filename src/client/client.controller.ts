import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
  Put,
} from '@nestjs/common';
import { ClientService } from './client.service';
import { Client as ClientModel } from '@prisma/client';

@Controller('client')
export class ClientController {
  constructor(private readonly clientService: ClientService) {}

  @Post()
  async signupClient(
    @Body() clientData: { name: string; balance: number },
  ): Promise<ClientModel> {
    return this.clientService.createClient(clientData);
  }

  @Get()
  async findAll() {
    return this.clientService.clients({});
  }

  @Get(':id')
  async findOne(@Param('id') id: string) {
    return this.clientService.client({ id: Number(id) });
  }

  @Put(':id')
  async reinsertClient(@Param('id') id: string): Promise<ClientModel> {
    return this.clientService.updateClient({
      where: { id: Number(id) },
      data: {},
    });
  }

  @Patch(':id')
  async updateClient(@Param('id') id: string): Promise<ClientModel> {
    return this.clientService.updateClient({
      where: { id: Number(id) },
      data: {},
    });
  }

  @Delete(':id')
  async removeClientById(@Param('id') id: string) {
    return this.clientService.deleteClient({ id: Number(id) });
  }

  @Delete()
  async removeClientByClient(
    @Body() clientData: { id: number; name: string; balance: number },
  ): Promise<ClientModel> {
    return this.clientService.deleteClient({ id: clientData.id });
  }
}
