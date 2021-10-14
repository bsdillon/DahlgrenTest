using System.ComponentModel.DataAnnotations;

namespace testAPI.DTOs
{
    public record UpdateItemDTO
    {
        [Required]
        public string Name {get; init;}
        [Required]
        [Range(1,1000)]
        public double Price {get; init; }
    }
}