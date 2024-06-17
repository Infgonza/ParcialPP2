package entidades;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.*;

@Entity
@Table(name="Genero")
public class Genero implements Serializable{

	private static final long serialVersionUID = 1L;
	
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private long id;
    @Column(name="denominacion")
    private String denominacion;
    
  //Hacemos la BIDIRECCIONALIDAD con articulo
	
  	@ManyToMany(mappedBy = "generos")
  	private List<Disco> discos = new ArrayList<Disco>();

  	public Genero() {
  	}

	public Genero(String denominacion) {
		this.denominacion = denominacion;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getDenominacion() {
		return denominacion;
	}

	public void setDenominacion(String denominacion) {
		this.denominacion = denominacion;
	}

	public List<Disco> getDiscos() {
		return discos;
	}

	public void setDiscos(List<Disco> discos) {
		this.discos = discos;
	}

	public Genero(String denominacion, List<Disco> discos) {
		this.denominacion = denominacion;
		this.discos = discos;
	}
  	
}
