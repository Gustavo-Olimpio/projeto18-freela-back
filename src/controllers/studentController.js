import { db } from "../database.connection.js";

export async function postStudents(req, res) {
    const {name,cpf,email,image,classId} = req.body
    try{
        await db.query(`INSERT INTO students (name,cpf,email,image,"classId") VALUES ($1,$2,$3,$4,$5);`,[name,cpf,email,image,classId])
        res.sendStatus(201)
        } catch (err) {
        return res.status(500).send(err.message);
        }
}

export async function getStudents(req, res) {
    const {id} = req.params
    try{
        const students = await db.query(`SELECT students.id AS "studentId",students.name,students.image,classes.class FROM students JOIN classes ON classes.id=$1 WHERE "classId" = $1`,[id])
        res.status(200).send(students.rows)
        } catch (err) {
        return res.status(500).send(err.message);
        }
}
export async function getStudentsById(req, res) {
    const {id} = req.params
    try{
        const students = await db.query(`SELECT students.*,classes.class FROM students JOIN classes ON classes.id=students."classId" WHERE students.id= $1`,[id])
        delete students.rows[0].classId
        res.status(200).send(students.rows[0])
        } catch (err) {
        return res.status(500).send(err.message);
        }
}