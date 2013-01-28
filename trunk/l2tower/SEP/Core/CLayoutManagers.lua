LayoutManagers = {}

function LayoutManagers.centralBoxLayout(view)
    for _,sv in pairs(view.subViews) do
        sv.x = view.x
        sv.y = view.y
        sv.width = view.width
        sv.height = view.height
        sv:layout()
    end
end

function LayoutManagers.verticalBoxLayout(view)
    local topEdge = view.y
    for _,sv in pairs(view.subViews) do
        sv.x = view.x
        sv.y = topEdge
        sv.width = view.width
        -- sv.height = sv.height
        topEdge = topEdge + sv.height
        sv:layout()
    end
end

function LayoutManagers.horizontalBoxLayout(view)
    local leftEdge = view.x
    for _,sv in pairs(view.subViews) do
        sv.x = leftEdge
        sv.y = view.y
        -- sv.width = sv.width
        sv.height = view.height
        leftEdge = leftEdge + sv.width
        sv:layout()
    end
end

