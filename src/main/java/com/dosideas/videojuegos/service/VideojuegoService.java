package com.dosideas.videojuegos.service;

import com.dosideas.videojuegos.domain.Videojuego;
import com.dosideas.videojuegos.repository.VideojuegoRepository;
import java.util.List;
import org.springframework.stereotype.Service;

@Service
public class VideojuegoService {
    private final VideojuegoRepository videojuegoRepository;

    public VideojuegoService(VideojuegoRepository videojuegoRepository) {
        this.videojuegoRepository = videojuegoRepository;
    }
    
    public List<Videojuego> buscarDestacados() {
        return videojuegoRepository.buscarTodos();
    }
    
    public List<Videojuego> buscarPorDistribuidor(int distribuidorId) {
        return videojuegoRepository.buscarPorDistribuidor(distribuidorId);
    }
    
    public List<Videojuego> buscar(String consulta) {
        return videojuegoRepository.buscar(consulta);
    }
    
    public Videojuego verDetalles(int id) {
        return videojuegoRepository.verDetalles(id);
    }
}