local part = game:GetService("Workspace").Challenge.PiggyPlaytime.PigZel.Union

-- Variável para controlar se o objeto já teve a hitbox expandida
local hitboxExpanded = false

-- Função para expandir a hitbox
local function expandHitbox(object, amount)
    if not hitboxExpanded then
        local originalSize = object.Size
        local newSize = originalSize + Vector3.new(amount, amount, amount)
        object.Size = newSize
        hitboxExpanded = true
    end
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
        -- Adicione um print para mostrar que o toque ocorreu
        print(character.Name .. " tocou no objeto com hitbox expandida!")
        -- Aqui você pode ajustar a lógica de movimento do personagem após a interação
    end
end

-- Configure a função onTouched para o objeto
part.Touched:Connect(onTouched)

-- Chame a função para expandir a hitbox do objeto em 10 unidades (se ainda não foi expandida)
expandHitbox(part, 10)

-- Chame a função para desenhar a hitbox do objeto
drawHitbox(part)

-- Loop para executar o script várias vezes
while true do
    wait(1) -- Aguarde 1 segundo entre as execuções do loop
    
    -- Aqui você pode adicionar qualquer lógica adicional que desejar executar no loop
    print("Script sendo executado no loop")
end
