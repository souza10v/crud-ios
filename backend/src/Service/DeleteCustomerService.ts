import { FastifyRequest, FastifyReply } from "fastify";
import prismaClient from "../../prisma";


interface DeleteUserProps {
    id: string;
}

class DeleteCustomerService{
    async execute({id} : DeleteUserProps) {
        if (!id) {
            throw new Error("Request Error")
        }

        const findUser = await prismaClient.customer.findFirst({
            where:{
                id: id
            }
        })

        if (!findUser){
            throw new Error("User not exist")
        }

        await prismaClient.customer.delete({
            where:{
                id: findUser.id
            }
        })

        return { message: "User deleted "}
    }
}

export {DeleteCustomerService}