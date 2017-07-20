package com.location.model;

import java.util.*;

import com.equipment.model.EquipmentVO;

public class LocationVO implements java.io.Serializable{
	private String locno;
	private String locname;
	private String tel;
	private String addr;
	private byte[] pic;
	private float lon;
	private float lat;
	private String status;
	
	//hibernate用
	private Set<EquipmentVO> emts = new HashSet<EquipmentVO>();
	
	public LocationVO() {
		super();
	}

	public String getLocno() {
		return locno;
	}

	public void setLocno(String locno) {
		this.locno = locno;
	}

	public String getLocname() {
		return locname;
	}

	public void setLocname(String locname) {
		this.locname = locname;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public byte[] getPic() {
		return pic;
	}

	public void setPic(byte[] pic) {
		this.pic = pic;
	}

	public float getLon() {
		return lon;
	}

	public void setLon(float lon) {
		this.lon = lon;
	}

	public float getLat() {
		return lat;
	}

	public void setLat(float lat) {
		this.lat = lat;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Set<EquipmentVO> getEmts() {
		return emts;
	}

	public void setEmts(Set<EquipmentVO> emts) {
		this.emts = emts;
	}
	
}