import prismaClient from "../../prisma";

interface CreateCustomerProps {
    name:string
    email:string
    position: string
}

class CreateCustomerService {

    async execute ({name, email, position } : CreateCustomerProps) {

        if (!name || !email || !position ) {
            throw new Error ("Preencha todos os campos")
        }

        const customer = await prismaClient.customer.create({
            data: {
                name,
                email,
                position,
                status: true
            }
        });

        return customer
    }
}

export { CreateCustomerService }