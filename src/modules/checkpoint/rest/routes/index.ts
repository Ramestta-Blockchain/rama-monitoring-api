import express from "express"
import { getCheckpointById, getAllcheckpoint } from "../controllers"
import { checkpointRestMiddleware } from "../../../../middlewares/authMiddleware"

const router = express.Router()

router.get("/one", getCheckpointById)
router.get("/all", checkpointRestMiddleware, getAllcheckpoint)


export default router