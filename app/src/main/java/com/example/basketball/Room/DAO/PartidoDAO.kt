package com.example.basketball.Room.DAO

import androidx.lifecycle.LiveData
import androidx.room.Dao
import androidx.room.Insert
import androidx.room.Query
import com.example.basketball.Room.Entities.Partido


@Dao
interface PartidoDAO {

    @Query("SELECT * FROM Partido")
    fun getAllPartidos() : LiveData<List<Partido>>

    @Insert
    suspend fun addPartido(partido : Partido)

}