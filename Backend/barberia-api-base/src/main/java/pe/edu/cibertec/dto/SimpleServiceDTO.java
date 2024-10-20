package pe.edu.cibertec.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class SimpleServiceDTO {
    private Long id;
    private String name;
    private String description;
    private Double price;
    private Integer duration_minutes;
}
