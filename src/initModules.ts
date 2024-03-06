import checkpointModule from "./modules/checkpoint"
import type { Express } from "express"
// import { checkpointTypeDefs, checkpointResolver } from "./modules/checkpoint/graph"
// author : @ramestta

// temporary: will remove in future
let checkpointTypeDefs: any
let checkpointResolver: any

export default {
    initRest: (app: Express): void => {
        checkpointModule.init(app)
    },
    initGraph: () => {
        return {
            typeDefs: `
            ${checkpointTypeDefs}
            `
            ,
            resolvers: {
                Query: {
                    ...checkpointResolver.Query,
                },
                Mutation: {
                    ...checkpointResolver.Mutation,

                }
            }
        }
    }
}
