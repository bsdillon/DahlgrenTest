using System;

namespace testAPI.DTOs
{
    public record ItemDTO
    {
        public Guid Id {get; init;}
        public string Name {get; init;}
        public double Price {get; init;}
        public DateTimeOffset CreatedDate {get; init;}
    }
}