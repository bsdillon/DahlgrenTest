# uvicorn API_FastAPI_Server_Test:app --reload

from typing import Optional

from fastapi import FastAPI
from pydantic import BaseModel, Field

import uuid

app = FastAPI()

def _find_next_id():
    return max(meat.meat_id for meat in meats) + 1

# uuid stuff breaks for mysterious reasons
# somehow, it becomes "mandatory" for the uuid to be included in the POST request, which is clearly stupid as hell

class Meat(BaseModel):
    #meat_id: str = Field(default_factory = uuid.uuid4().hex, alias = "id")
    meat_id: int = Field(default_factory = _find_next_id, alias = "id")
    color: str
    weight: str
    flavor: str
    personality: str

meats = [
    #Meat(id = uuid.uuid4().hex, color = "red", weight = "heavy", flavor = "strong", personality = "saccharine"),
    #Meat(id = uuid.uuid4().hex, color = "brown", weight = "medium", flavor = "weak", personality = "cruel"),
    #Meat(id = uuid.uuid4().hex, color = "pink", weight = "light", flavor = "medium", personality = "impetuous"),
    Meat(id = 1, color = "red", weight = "heavy", flavor = "strong", personality = "saccharine"),
    Meat(id = 2, color = "brown", weight = "medium", flavor = "weak", personality = "cruel"),
    Meat(id = 3, color = "pink", weight = "light", flavor = "medium", personality = "impetuous"),
]

@app.get("/meats")
async def get_meats():
    return meats

@app.post("/meats", status_code = 201)
async def add_meat(meat: Meat):
    meats.append(meat)
    return meat

@app.put("/meats")
async def replace_meat(meat: Meat):
    # should probably add the meat to the list if the ID is missing?
    meats[:] = [meat if item.meat_id == meat.meat_id else item for item in meats]
    return meat

@app.patch("/meats")
async def edit_meat(meat: Meat):
    # seems like this won't work without the appropriate "Optional[str] = None" chunks in the original Meat class
    # some sort of wrapper may be required...
    # PATCH shouldn't add a new item like PUT is supposed to, so maybe it should throw errors if the ID fails
    update_data = meat.dict(exclude_unset = True)
    oldMeat = next(x for x in meats if x.meat_id == update_data["meat_id"])
    # add error handling as appropriate
    stored_meat_model = Meat(**oldMeat.dict())
    newMeat = stored_meat_model.copy(update = update_data)
    meats[:] = [newMeat if item.meat_id == newMeat.meat_id else item for item in meats]
    return newMeat

@app.delete("/meats", status_code = 204)
async def delete_meat(incoming_meat_id):
    incoming_meat_id = int(incoming_meat_id)
    meat = next(x for x in meats if x.meat_id == incoming_meat_id)
    if(meat != None):
        meats.remove(meat)
