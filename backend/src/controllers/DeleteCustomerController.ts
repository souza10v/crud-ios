import { FastifyRequest, FastifyReply } from "fastify";
import { DeleteCustomerService } from "../Service/DeleteCustomerService";

class DeleteCustomerController {
    async handle(request: FastifyRequest, reply: FastifyReply){

        const {id} = request.query as { id: string }

        const deleteCustomerService = new DeleteCustomerService()

        const user = await deleteCustomerService.execute({ id })

        reply.send(user)
    }

}

export {DeleteCustomerController}