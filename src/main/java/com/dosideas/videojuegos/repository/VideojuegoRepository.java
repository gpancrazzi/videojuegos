package com.dosideas.videojuegos.repository;

import com.dosideas.videojuegos.domain.Videojuego;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface VideojuegoRepository extends JpaRepository<Videojuego, Integer>{
    @Query("from Videojuego v order by v.nombre")
    List<Videojuego> buscarTodos();
    
    @Query("from Videojuego v where v.distribuidor.id = ?1 order by v.nombre")
    List<Videojuego> buscarPorDistribuidor(int distribuidorId);
    
    @Query("from Videojuego v where v.nombre like %?1% or v.descripcion like %?1% order by v.nombre") 
    List<Videojuego> buscar(String consulta);
    
    @Query("from Videojuego v where v.id = ?1")
    Videojuego verDetalles(int id);
}