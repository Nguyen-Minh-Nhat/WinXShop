package winx.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "TAIKHOAN")

public class TaiKhoan {
	@Id
	@Column(name = "Email")
	private String email;
	@Column(name ="MatKhau")
	private String matKhau;
	@Column(name = "TrangThai")
	private byte trangThai;
	@Column (name = "Quyen")
	private byte quyen;
	@Column(name = "NgayTao")
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "dd/mm/yyyy")
	private Date ngayTao;
	@OneToOne(mappedBy = "taiKhoan")
	private KhachHang khachHang;
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMatKhau() {
		return matKhau;
	}
	public void setMatKhau(String matKhau) {
		this.matKhau = matKhau;
	}
	public byte getTrangThai() {
		return trangThai;
	}
	public void setTrangThai(byte trangThai) {
		this.trangThai = trangThai;
	}
	public byte getQuyen() {
		return quyen;
	}
	public void setQuyen(byte quyen) {
		this.quyen = quyen;
	}
	public Date getNgayTao() {
		return ngayTao;
	}
	public void setNgayTao(Date ngayTao) {
		this.ngayTao = ngayTao;
	}
	public KhachHang getKhachHang() {
		return khachHang;
	}
	public void setKhachHang(KhachHang khachHang) {
		this.khachHang = khachHang;
	}
}