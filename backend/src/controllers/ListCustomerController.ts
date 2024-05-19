import { FastifyRequest, FastifyReply } from "fastify";
import { ListCustomerService } from "../Service/ListCustomerService";

class ListCustomerController {
    async handle(request: FastifyRequest, reply: FastifyReply){

        const listCustomerService = new ListCustomerService()

        const users = await listCustomerService.execute()

        reply.send(users)
    }
}

export { ListCustomerController }