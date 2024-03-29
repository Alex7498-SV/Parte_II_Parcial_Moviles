package com.example.basketball.Room.RoomDB

import android.content.Context
import androidx.room.Database
import androidx.room.Room
import androidx.room.RoomDatabase
import com.example.basketball.Room.DAO.PartidoDAO
import com.example.basketball.Room.Entities.Partido

@Database(entities = arrayOf(Partido::class), version = 1)
public abstract class PartidoRoomDatabase : RoomDatabase(){

    abstract fun partidoDao() : PartidoDAO

    companion object{
        @Volatile
        private var INSTANCE : PartidoRoomDatabase? = null

        fun getDatabase(context: Context): PartidoRoomDatabase {
            val tempInstance = INSTANCE
            if (tempInstance != null) {
                return tempInstance
            }
            synchronized(this) {
                val instance = Room.databaseBuilder(
                    context.applicationContext,
                    PartidoRoomDatabase::class.java,
                    "Word_database"
                ).build()
                INSTANCE = instance
                return instance
            }
        }
    }

}