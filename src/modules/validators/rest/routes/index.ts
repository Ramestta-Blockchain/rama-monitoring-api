import express from "express"
import { getValidatorById, getAllValidator } from "../controllers"
import { validatorRestMiddleware } from "../../../../middlewares/authMiddleware"

const router = express.Router()

router.get("/one", getValidatorById)
router.get("/all", validatorRestMiddleware, getAllValidator)


export default router