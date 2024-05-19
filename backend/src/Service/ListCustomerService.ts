import prismaClient from "../../prisma";

class ListCustomerService {
    async execute(){

        const customer = await prismaClient.customer.findMany()
        
        console.log("reading data")
        return customer;
    }
}

export { ListCustomerService }