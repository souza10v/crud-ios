import { FastifyRequest, FastifyReply } from "fastify";
import { CreateCustomerService } from "../Service/CreateCustomerService";

class CreateCustomerController {
    async handle(request: FastifyRequest, reply: FastifyReply) {

        //console.log("Request received:", request.body); // Log the incoming request
        const { name, email, position } = request.body as { name: string, email: string, position: string };
        const customerService = new CreateCustomerService();
        const customer = await customerService.execute({ name, email, position });
        console.log("Customer created:", customer); // Log the created customer

        // Send a success message along with the created customer data
        reply.send({
            message: "User created successfully",
            customer: customer
        });

    }
}

export { CreateCustomerController }