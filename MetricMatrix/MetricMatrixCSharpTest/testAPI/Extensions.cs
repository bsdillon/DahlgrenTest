using testAPI.DTOs;
using testAPI.Entities;

namespace testAPI
{
    public static class Extensions{
        public static ItemDTO AsDto(this Item item)
        {
            return new ItemDTO
            {
                Id = item.Id,
                Name = item.Name,
                Price = item.Price,
                CreatedDate = item.CreatedDate
            };
        }
    }
}