package entidades;

import java.io.Serializable;

import javax.persistence.*;
@Entity
@Table(name="domicilio")
public class Domicilio implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Long id;
	@Column(name="calle")
    private String calle;
	@Column(name="numero")
    private int numero;
	
	@OneToOne(mappedBy="domicilio")
	private Cliente cliente;
	
	
	public Domicilio(){
	
	}

	public Domicilio(String calle, int numero) {
		this.calle = calle;
		this.numero = numero;
	}

	public Domicilio(String calle, int numero, Cliente cliente) {
		super();
		this.calle = calle;
		this.numero = numero;
		this.cliente = cliente;
	}

	public Cliente getCliente() {
		return cliente;
	}

	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getCalle() {
		return calle;
	}

	public void setCalle(String calle) {
		this.calle = calle;
	}

	public int getNumero() {
		return numero;
	}

	public void setNumero(int numero) {
		this.numero = numero;
	}
	
}
