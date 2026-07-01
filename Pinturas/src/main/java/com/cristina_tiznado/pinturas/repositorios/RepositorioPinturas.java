package com.cristina_tiznado.pinturas.repositorios;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.cristina_tiznado.pinturas.modelos.Pintura;

@Repository
public interface RepositorioPinturas extends CrudRepository<Pintura, Long>{
    List<Pintura> findAll();
    Optional<Pintura> findByTitulo(String titulo);
}
