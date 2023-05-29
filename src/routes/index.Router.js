import { Router } from "express";
import { studentValidation } from "../middlewares/student.Validation.js";
import { deliveryValidation } from "../middlewares/delivery.Validation.js";
import { postDelivery,getProjects, putGrade } from "../controllers/deliveryController.js";
import { postStudents,getStudents,getStudentsById } from "../controllers/studentController.js";

const router=Router();
router.post('/signUp', studentValidation,postStudents);
router.post('/delivery', deliveryValidation,postDelivery);
router.get('/students/:id', getStudents);
router.get('/students/:idClass/:idProject', getProjects);
router.get('/studentsById/:id', getStudentsById);
router.put('/grade/:id',putGrade)
export default router