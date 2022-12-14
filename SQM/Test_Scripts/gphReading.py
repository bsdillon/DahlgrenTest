# open gph file
gph = open(r'/home/azureuser/Desktop/Output/egonet/egonet/egonet.gph', "r")

#setup separate nodes and edges text file
nodes = open("nodes.gph", "a+")
edges = open("edges.txt", "a+")

#setup rejectedNodes list
rejectNodes = []

#binary search to search through rejectedNodes
def binary_search(arr, x):
    low = 0
    high = len(arr) - 1
    mid = 0

    while low <= high:
        mid = (high + low) // 2
        # If x is greater, ignore left half
        if arr[mid] < x:
            low = mid + 1
        # If x is smaller, ignore right half
        elif arr[mid] > x:
            high = mid - 1
        # means x is present at mid
        else:
            return mid
    # If we reach here, then the element was not present
    return -1


for line in gph:
    #isolates elements in line of text file
    txt = line.split()
    # Node
    if (line.startswith("Node")) :
        if (txt[4] == "--" or txt[4] == "" or line.endswith("(-1):") or line.endswith("--") or "):" in txt[4] or txt[5] == ("(-1):")):
            rejectNodes.append(int(txt[1]))
        else:
            nodes.write(line[0:])
    # Edge
    if (line.startswith("Edge")):
        if ( binary_search(rejectNodes, int(txt[1])) == -1 and binary_search(rejectNodes, int(txt[2])) == -1):
            edges.write(txt[1] + ' ' + txt[2] + "\n")

# print(rejectNodes)
nodes.close()
edges.close()

