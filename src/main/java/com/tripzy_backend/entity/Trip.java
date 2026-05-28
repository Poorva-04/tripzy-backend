package com.tripzy_backend.entity;

import java.time.LocalDate;
import java.time.LocalDateTime;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.PrePersist;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name="trips")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Trip {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	@Column(nullable=false)
	private String source;
	@Column(nullable=false)
	private String destination;
	private int days;
	private double budget;
	private String interests;
	private String transportation;
	private String accommodation;
	private LocalDate startDate;
	private LocalDate endDate;
	private int travelers;
	@Column(length=10000 , columnDefinition="TEXT")
	private String itinerary;
	private String status;
	private LocalDateTime createdAt;
	@ManyToOne
	@JoinColumn(name="user_id")
	@JsonIgnore
	private User user;
	
	@PrePersist
	public void prePersist() {

	    createdAt = LocalDateTime.now();

	    if(status == null) {
	        status = "PLANNED";
	    }
	}

}
