package com.example.basketball.Repository

import androidx.annotation.WorkerThread
import androidx.lifecycle.LiveData
import com.example.basketball.Room.DAO.PartidoDAO
import com.example.basketball.Room.Entities.Partido

class PartidoRepository(private val partidoDao : PartidoDAO) {

    val allPartidos : LiveData<List<Partido>> = partidoDao.getAllPartidos()

    @WorkerThread
    suspend fun insert(partido : Partido){
        partidoDao.addPartido(partido)
    }

    fun getAll() : LiveData<List<Partido>> = partidoDao.getAllPartidos()
}