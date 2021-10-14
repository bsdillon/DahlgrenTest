using System;
using System.Collections.Generic;
using testAPI.Entities;

namespace testAPI.Repo
{
        public interface IItemRepo
    {
        Item GetItem(Guid id);
        IEnumerable<Item> GetItems();
        void CreateItem(Item item);
        void UpdateItem(Item item);
        void DeleteItem(Guid id);
    }
}