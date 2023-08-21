local part = game:GetService("Workspace").Challenge.PiggyPlaytime.PigZel.Union

-- Função para expandir a hitbox
local function expandHitbox(object, amount)
    local originalSize = object.Size
    local newSize = originalSize + Vector3.new(amount, amount, amount)
    object.Size = newSize
end

-- Função para desenhar a hitbox
local function drawHitbox(object)
    local box = Instance.new("SelectionBox")
    box.Parent = object
    box.Adornee = object
end

-- Função para lidar com toques no objeto
local function onTouched(otherPart)
    local character = otherPart.Parent
    if character and character:FindFirstChild("Humanoid") then
        local humanoid = character:FindFirstChild("Humanoid")
        -- Aqui você pode adicionar a lógica para lidar com a interação
        print(character.Name .. " tocou no objeto com hitbox expandida!")
    end
end

-- Configure a função onTouched para o objeto
part.Touched:Connect(onTouched)

-- Chame a função para expandir a hitbox do objeto em 10 unidades
expandHitbox(part, 10)

-- Chame a função para desenhar a hitbox do objeto
drawHitbox(part)
