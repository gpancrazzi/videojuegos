package com.dosideas.videojuegos.controller;

import com.dosideas.videojuegos.domain.Videojuego;
import com.dosideas.videojuegos.service.VideojuegoService;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ListadoController {
    private final VideojuegoService videojuegoService;

    public ListadoController(VideojuegoService videojuegoService) {
        this.videojuegoService = videojuegoService;
    }
    
    @RequestMapping("/videojuegosPorDistribuidor")
    public String listarVideojuegosPorDistribuidor(int distribuidorId, Model model) {
        List<Videojuego> juegos = videojuegoService.buscarPorDistribuidor(distribuidorId);
        model.addAttribute("videojuegos", juegos);
        return "listado";
    }
    
    @RequestMapping("/")
    public String listarVideojuegos(Model model) {
        List<Videojuego> destacados = videojuegoService.buscarDestacados();
        model.addAttribute("videojuegos", destacados);
        return "listado";
    }
    
    @RequestMapping("/buscar")
    public String buscar(@RequestParam("q") String consulta, Model model) {
        List<Videojuego> juegos = videojuegoService.buscar(consulta);
        model.addAttribute("videojuegos", juegos);
        return "listado";
    }
    
    @RequestMapping("/verDetalles")
    public String verDetalles(int id, Model model) {
        Videojuego detalles = videojuegoService.verDetalles(id);
        model.addAttribute("videojuegos", detalles);
        return "detalle";
    }
}