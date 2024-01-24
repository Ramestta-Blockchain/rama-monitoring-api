import checkpointRouter from "./rest/routes"
import type { Express } from "express"

export default {
    init: (app: Express) => {
        app.use("/api/v1/monitor/checkpoint/", checkpointRouter)
        console.log("[module]: auth module successfully loaded")
    }
}