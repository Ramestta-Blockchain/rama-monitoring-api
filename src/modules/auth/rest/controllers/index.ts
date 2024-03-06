import type { Response, NextFunction } from "express"
import { asyncMiddleware } from "../../../../middlewares/asyncMiddleware"
import { Request } from '../../../../middlewares/authMiddleware'

export const getUserById = asyncMiddleware(async (req: Request, res: Response, _next: NextFunction) => {
    try {

    } catch (error) {

    }
})

export const getAllUser = asyncMiddleware(async (req: Request, res: Response, _next: NextFunction) => {
    try {

    } catch (error) {

    }
})

export const signup = asyncMiddleware(async (req: Request, res: Response, _next: NextFunction) => {
    try {

    } catch (error) {

    }
})

export const login = asyncMiddleware(async (req: Request, res: Response, _next: NextFunction) => {
    try {

    } catch (error) {

    }
})