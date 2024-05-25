import prismaClient from "../../prisma";

interface UpdateCustomerProps {
    id: string;
    name: string;
    email: string;
    position: string;
    status: boolean;
}

class EditCustomerService {

    async execute({id, name, email, position, status} : UpdateCustomerProps){
        if (!name || !email || !position) {
            throw new Error("Preencha todos os campos")
        }

        console.log(name, email, position, status)

        const user = await prismaClient.customer.update({
            where: {id: id},
            data:{
                name: name,
                email: email,
                status: status,
                position: position,
                update_at: new Date(),
            },
        })

        return { user }
    }
}

export {EditCustomerService}