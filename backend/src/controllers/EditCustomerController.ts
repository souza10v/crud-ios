import { FastifyRequest, FastifyReply } from "fastify";
import { EditCustomerService } from "../Service/EditCustomerService";

class EditCustomerController {
    async handle(request: FastifyRequest, reply: FastifyReply){

        const {id} = request.query as { id: string }

        const { name, email, position, status } = request.body as {name: string, email: string, position: string, status: boolean}

        const editCustomerService = new EditCustomerService()

        const user = await editCustomerService.execute({ id, name, email, position, status})

        reply.send(user)
    }
}

export {EditCustomerController}