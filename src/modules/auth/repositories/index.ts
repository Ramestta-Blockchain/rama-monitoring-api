import { Prisma, type User } from "@prisma/client"
import { prisma } from "../../../config"
import { GraphQLResolveInfo } from "graphql"
import { infoExtractForGraphql } from "../../../shared/infoExtractForGraphql";


type UserExtraParams = {
    where?: any;
    includes?: {
        validator: boolean,
        delegator: boolean,
        node: boolean
    },
    info?: GraphQLResolveInfo,
    orderBy?: {
        [key: string]: 'asc' | 'desc'
    },
    limit?: any,
    offset?: any,
    skip?: any
}


export const FindOne = async ({ where, includes, info }: UserExtraParams): Promise<User | null> => {
    try {
        const select = info ? infoExtractForGraphql(info) : []
        const isValidator = select.includes("validator");
        const isDelegator = select.includes("delegator");
        const isNode = select.includes("node");

        return await prisma.user.findUnique({
            where: where ? where as any : undefined,
            include: {
                validators: isValidator || includes?.validator as boolean,
                delegators: isDelegator || includes?.delegator as boolean,
                nodes: isNode || includes?.node as boolean,
            },
        })
    } catch (e) {
        if (e instanceof Prisma.PrismaClientKnownRequestError) {
            // The .code property can be accessed in a type-safe manner
            if (e.code === 'P2001') {
                console.log(
                    'data does not exist'
                )
            }
        }
        throw e

    }
}

export const FindMany = async ({ where, includes, info, orderBy, limit, offset, skip }: UserExtraParams): Promise<User[]> => {

    try {
        const select = info ? infoExtractForGraphql(info) : []
        const isValidator = select.includes("validator");
        const isDelegator = select.includes("delegator");
        const isNode = select.includes("node");
        return await prisma.user.findMany({
            skip: skip || offset ? skip + offset : 0,
            take: limit ? limit : 10,
            where: where ? where : undefined,
            include: {
                validators: isValidator || includes?.validator,
                delegators: isDelegator || includes?.delegator,
                nodes: isNode || includes?.node,
            },
            orderBy: {
                ...orderBy,
                id: 'desc'
            }

        })

    } catch (e) {
        if (e instanceof Prisma.PrismaClientKnownRequestError) {
            // The .code property can be accessed in a type-safe manner
            if (e.code === 'P2001') {
                console.log(
                    'data does not exist'
                )
            }
        }
        throw e
    }
}

export const Create = async (body: any): Promise<User> => {
    try {
        return await prisma.user.create({
            data: {
                ...body
            }
        })

    } catch (e) {
        if (e instanceof Prisma.PrismaClientKnownRequestError) {
            // The .code property can be accessed in a type-safe manner
            if (e.code === 'P2001') {
                console.log(
                    'data does not exist'
                )
            }
        }
        throw e
    }
}

export const Update = async (where: any, body: any): Promise<User> => {
    try {
        return await prisma.user.update({
            where: where,
            data: {
                ...body
            }
        })

    } catch (e) {
        if (e instanceof Prisma.PrismaClientKnownRequestError) {
            // The .code property can be accessed in a type-safe manner
            if (e.code === 'P2001') {
                console.log(
                    'data does not exist'
                )
            }
        }
        throw e
    }

}

export const Delete = async (id: any): Promise<User> => {
    try {
        return await prisma.user.delete({
            where: {
                id: id
            }
        })
    } catch (e) {
        if (e instanceof Prisma.PrismaClientKnownRequestError) {
            // The .code property can be accessed in a type-safe manner
            if (e.code === 'P2001') {
                console.log(
                    'data does not exist'
                )
            }
        }
        throw e
    }
}






