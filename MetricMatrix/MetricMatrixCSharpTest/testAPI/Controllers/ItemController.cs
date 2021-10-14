using System.Collections.Generic;
using testAPI.Entities;
using Microsoft.AspNetCore.Mvc;
using testAPI.Repo;
using System;
using System.Linq;
using testAPI.DTOs;

namespace testAPI.Controllers
{
    //GET /items

    [ApiController]
    [Route("items")]
    public class ItemController : ControllerBase
    {
        private readonly IItemRepo repo;

        public ItemController(IItemRepo repository)
        {
            this.repo = repository;
        }

        //this is called when a GET request is performed on "items". e.g. GET /items
        [HttpGet]
        public IEnumerable<ItemDTO> GetItems()
        {
            var items = repo.GetItems().Select(item => item.AsDto());
            return items;
        }

        //this is called when a GET request is performed on a specific item. e.g. GET /items/{id}
        [HttpGet("{id}")]
        public ActionResult<ItemDTO> GetItem(Guid id)
        {
            var item = repo.GetItem(id);

            if(item is null)
            {
                return NotFound();
            }
            return item.AsDto();
        }

        //this is called when a POST request is performed on items
        [HttpPost]
        public ActionResult<ItemDTO> CreateItem(CreateItemDTO itemDTO)
        {
            Item item = new(){
                Id = Guid.NewGuid(),
                Name = itemDTO.Name,
                Price = itemDTO.Price,
                CreatedDate = DateTimeOffset.UtcNow
            };

            repo.CreateItem(item);

            return CreatedAtAction(nameof(GetItem), new { id = item.Id}, item.AsDto());
        }

        //this is called when a PUT request is performed on items //PUT /items/{id}
        [HttpPut("{id}")]
        public ActionResult UpdateItem(Guid id, UpdateItemDTO itemDTO)
        {
            var existingItem = repo.GetItem(id);
            if (existingItem is null){
                return NotFound();
            }

            //with expresions takes a copy of existingItem and modifies the two values in the function. This al
            Item updatedItem = existingItem with 
            {
                Name = itemDTO.Name,
                Price = itemDTO.Price
            };

            repo.UpdateItem(updatedItem);

            return NoContent();
        }

        //this is called when a DELETE request is performed on items //DELETE /items/{id}
        [HttpDelete("{id}")]
        public ActionResult DeleteItem(Guid id)
        {
            var existingItem = repo.GetItem(id);
            if (existingItem is null){
                return NotFound();
            }
            
            repo.DeleteItem(id);

            return NoContent();
        }
    }
    
}