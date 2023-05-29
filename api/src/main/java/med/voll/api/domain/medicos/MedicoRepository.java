package med.voll.api.domain.medicos;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

//mediante esta interfaz establecemos la conecion de la clase medicos con el tipo de id
public interface MedicoRepository extends JpaRepository<Medico, Long> {

    Page<Medico>findByActivoTrue(Pageable paginacion);
}
