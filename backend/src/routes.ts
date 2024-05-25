import { FastifyInstance, FastifyPluginOptions, FastifyRequest, FastifyReply } from "fastify" 
import { CreateCustomerController } from "./controllers/CreateCurstomerController"
import { request } from "http"
import { ListCustomerController } from "./controllers/ListCustomerController"
import { EditCustomerController } from "./controllers/EditCustomerController"

export async function routes(fastify: FastifyInstance, options: FastifyPluginOptions) {
    fastify.get("/teste", async (request: FastifyRequest, reply:FastifyReply) => {
        return{ ok: true}
    })

    fastify.post("/user", async (request: FastifyRequest, reply:FastifyReply) => {
        return new CreateCustomerController().handle(request, reply)
    })

    fastify.get("/users", async(request: FastifyRequest, reply: FastifyReply) => {
        return new ListCustomerController().handle(request, reply)
    })

    fastify.put("/user", async(request: FastifyRequest, reply: FastifyReply) => {
        return new EditCustomerController().handle(request, reply)
    })
}