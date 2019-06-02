package com.example.basketball.ViewModel

import android.app.Application
import androidx.lifecycle.AndroidViewModel
import androidx.lifecycle.LiveData
import androidx.lifecycle.viewModelScope
import com.example.basketball.Repository.PartidoRepository
import com.example.basketball.Room.Entities.Partido
import com.example.basketball.Room.RoomDB.PartidoRoomDatabase
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch

class PartidoViewModel(application: Application) : AndroidViewModel(application) {

    var contA : Int = 0
    var contB :Int = 0

    private val repository : PartidoRepository
    val allPartidos : LiveData<List<Partido>>

    init {
        val partidodao = PartidoRoomDatabase.getDatabase(application).partidoDao()
        repository = PartidoRepository(partidodao)
        allPartidos = repository.allPartidos
    }

    fun insert(partido : Partido) = viewModelScope.launch(Dispatchers.IO){
        repository.insert(partido)
    }


}