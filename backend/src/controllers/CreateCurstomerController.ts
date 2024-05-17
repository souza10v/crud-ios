import { FastifyRequest, FastifyReply } from "fastify";
import { CreateCustomerService } from "../Service/CreateCustomerService";

class CreateCustomerController {
    async handle(request: FastifyRequest, reply: FastifyReply) {

        const { name, email } = request.body as {name: string, email: string}

        const customerService = new CreateCustomerService()

        const customer = await customerService.execute({ name, email })

        console.log("Created")
        //reply.send(customer)
    }
}

export {CreateCustomerController}