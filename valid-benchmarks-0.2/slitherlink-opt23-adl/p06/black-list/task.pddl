(define (problem sliterlink-534501)                       (:domain slitherlink)                       (:objects cell-outside-2-up - cell
n-4-7 - node
cell-2-0 - cell
n-1-6 - node
n-3-6 - node
n-0-1 - node
n-0-6 - node
cell-0-6 - cell
cell-outside-4-down - cell
cell-2-5 - cell
cell-2-2 - cell
n-0-7 - node
n-4-4 - node
cell-2-1 - cell
n-4-8 - node
cell-outside-1-left - cell
cell-1-1 - cell
cell-3-2 - cell
n-3-2 - node
cell-1-2 - cell
cell-outside-7-up - cell
n-1-4 - node
cell-0-3 - cell
cap-0 - cell-capacity-level
cap-4 - cell-capacity-level
n-3-3 - node
cell-3-3 - cell
cell-outside-1-up - cell
n-1-7 - node
n-2-5 - node
cell-outside-2-right - cell
n-4-3 - node
n-2-0 - node
cell-outside-6-up - cell
n-3-0 - node
n-1-3 - node
cell-2-3 - cell
cell-1-0 - cell
cell-outside-4-up - cell
n-1-1 - node
n-3-8 - node
n-2-4 - node
cell-3-5 - cell
n-2-8 - node
cell-0-4 - cell
cell-outside-0-right - cell
n-0-5 - node
n-3-5 - node
n-0-3 - node
cell-3-7 - cell
cell-outside-3-right - cell
cell-outside-2-down - cell
cell-outside-5-up - cell
n-3-1 - node
n-2-6 - node
cell-1-6 - cell
cell-2-6 - cell
cell-outside-1-right - cell
n-4-1 - node
n-0-4 - node
cell-2-7 - cell
n-3-4 - node
cell-3-6 - cell
cell-0-7 - cell
n-4-6 - node
cell-0-0 - cell
n-2-2 - node
n-3-7 - node
cell-1-5 - cell
cell-1-3 - cell
n-0-0 - node
cell-outside-1-down - cell
cap-2 - cell-capacity-level
n-2-7 - node
cell-outside-5-down - cell
cell-outside-3-left - cell
cell-outside-3-down - cell
cell-3-1 - cell
cell-outside-6-down - cell
n-2-3 - node
cell-outside-3-up - cell
n-1-0 - node
n-1-5 - node
n-0-8 - node
cell-3-4 - cell
cap-3 - cell-capacity-level
cell-2-4 - cell
cell-1-7 - cell
n-1-2 - node
cell-outside-0-up - cell
cell-outside-2-left - cell
cell-3-0 - cell
n-1-8 - node
cell-0-1 - cell
cell-0-2 - cell
n-2-1 - node
cell-1-4 - cell
cell-outside-0-down - cell
cell-outside-7-down - cell
n-4-0 - node
n-4-2 - node
cell-0-5 - cell
cell-outside-0-left - cell
n-0-2 - node
cap-1 - cell-capacity-level
n-4-5 - node)                        (:init (cell-edge-copy cell-outside-7-up cell-0-7 n-0-7 n-0-8)
(cell-capacity cell-3-1 cap-4)
(cell-capacity-inc-copy cap-3 cap-4)
(cell-edge cell-3-5 cell-3-6 n-3-6 n-4-6)
(cell-edge-copy cell-2-0 cell-2-1 n-2-1 n-3-1)
(cell-capacity cell-outside-1-up cap-1)
(node-degree0-copy n-3-6)
(cell-edge-copy cell-0-1 cell-1-1 n-1-1 n-1-2)
(cell-edge cell-1-2 cell-2-2 n-2-2 n-2-3)
(node-degree0 n-4-2)
(cell-capacity cell-2-5 cap-4)
(cell-edge-copy cell-1-4 cell-1-5 n-1-5 n-2-5)
(cell-capacity cell-0-5 cap-1)
(cell-edge-copy cell-outside-2-up cell-0-2 n-0-2 n-0-3)
(cell-capacity-copy cell-2-4 cap-4)
(cell-edge-copy cell-3-1 cell-3-2 n-3-2 n-4-2)
(cell-edge-copy cell-1-3 cell-2-3 n-2-3 n-2-4)
(cell-capacity-copy cell-0-1 cap-4)
(cell-capacity-copy cell-3-0 cap-4)
(node-degree0 n-2-5)
(node-degree0-copy n-1-4)
(cell-edge cell-0-4 cell-0-5 n-0-5 n-1-5)
(cell-edge-copy cell-2-2 cell-3-2 n-3-2 n-3-3)
(cell-capacity-copy cell-outside-4-up cap-1)
(cell-capacity-inc cap-1 cap-2)
(cell-capacity-copy cell-2-7 cap-4)
(cell-capacity cell-outside-3-left cap-1)
(cell-capacity cell-outside-1-left cap-1)
(cell-edge cell-0-1 cell-1-1 n-1-1 n-1-2)
(cell-edge cell-2-7 cell-3-7 n-3-7 n-3-8)
(cell-edge-copy cell-outside-3-up cell-0-3 n-0-3 n-0-4)
(cell-capacity cell-outside-3-right cap-1)
(node-degree0 n-0-6)
(cell-capacity-copy cell-3-1 cap-4)
(cell-edge cell-outside-6-up cell-0-6 n-0-6 n-0-7)
(cell-edge cell-outside-2-up cell-0-2 n-0-2 n-0-3)
(cell-capacity cell-outside-0-up cap-1)
(cell-capacity-inc-copy cap-1 cap-2)
(cell-edge-copy cell-2-2 cell-2-3 n-2-3 n-3-3)
(cell-capacity-copy cell-outside-1-up cap-1)
(cell-edge-copy cell-0-7 cell-1-7 n-1-7 n-1-8)
(node-degree0 n-4-4)
(cell-edge-copy cell-1-5 cell-1-6 n-1-6 n-2-6)
(cell-edge cell-3-3 cell-3-4 n-3-4 n-4-4)
(cell-capacity-copy cell-2-5 cap-4)
(cell-edge cell-0-6 cell-0-7 n-0-7 n-1-7)
(cell-capacity cell-3-2 cap-1)
(cell-edge cell-3-4 cell-3-5 n-3-5 n-4-5)
(cell-capacity cell-3-5 cap-2)
(node-degree0 n-2-6)
(cell-edge cell-1-1 cell-1-2 n-1-2 n-2-2)
(cell-edge cell-3-2 cell-3-3 n-3-3 n-4-3)
(node-degree0-copy n-1-5)
(cell-edge-copy cell-2-3 cell-2-4 n-2-4 n-3-4)
(cell-edge cell-2-0 cell-3-0 n-3-0 n-3-1)
(cell-capacity cell-1-6 cap-4)
(cell-edge cell-outside-3-up cell-0-3 n-0-3 n-0-4)
(node-degree0-copy n-1-1)
(cell-capacity cell-outside-7-down cap-1)
(cell-capacity cell-outside-2-right cap-1)
(node-degree0-copy n-4-5)
(node-degree0 n-1-7)
(cell-edge-copy cell-0-0 cell-1-0 n-1-0 n-1-1)
(node-degree0 n-4-0)
(cell-capacity-copy cell-outside-3-left cap-1)
(cell-capacity-copy cell-outside-1-left cap-1)
(node-degree0 n-3-7)
(cell-edge-copy cell-0-5 cell-1-5 n-1-5 n-1-6)
(cell-capacity-copy cell-outside-3-right cap-1)
(node-degree0 n-2-0)
(cell-capacity-copy cell-outside-1-right cap-1)
(node-degree0 n-0-7)
(cell-edge cell-2-1 cell-3-1 n-3-1 n-3-2)
(cell-edge-copy cell-outside-4-up cell-0-4 n-0-4 n-0-5)
(node-degree0-copy n-0-4)
(cell-capacity cell-3-6 cap-1)
(cell-capacity-copy cell-outside-0-up cap-1)
(cell-edge-copy cell-1-1 cell-2-1 n-2-1 n-2-2)
(cell-edge-copy cell-0-2 cell-1-2 n-1-2 n-1-3)
(cell-edge cell-0-0 cell-1-0 n-1-0 n-1-1)
(cell-edge-copy cell-outside-1-left cell-1-0 n-1-0 n-2-0)
(node-degree0 n-2-2)
(cell-capacity cell-0-2 cap-4)
(cell-capacity-copy cell-3-2 cap-1)
(cell-capacity-copy cell-3-5 cap-2)
(cell-edge-copy cell-0-0 cell-0-1 n-0-1 n-1-1)
(cell-edge-copy cell-2-3 cell-3-3 n-3-3 n-3-4)
(cell-capacity-copy cell-outside-7-down cap-1)
(cell-capacity-copy cell-outside-2-right cap-1)
(cell-capacity cell-2-1 cap-4)
(cell-capacity cell-0-4 cap-4)
(cell-edge cell-outside-4-up cell-0-4 n-0-4 n-0-5)
(cell-capacity cell-outside-7-up cap-1)
(cell-edge cell-3-0 cell-3-1 n-3-1 n-4-1)
(cell-edge cell-3-7 cell-outside-3-right n-3-8 n-4-8)
(cell-edge-copy cell-3-2 cell-outside-2-down n-4-2 n-4-3)
(cell-edge-copy cell-outside-0-up cell-0-0 n-0-0 n-0-1)
(cell-edge cell-0-2 cell-1-2 n-1-2 n-1-3)
(node-degree0 n-4-8)
(node-degree0 n-4-7)
(node-degree0-copy n-0-5)
(node-degree0 n-2-7)
(cell-capacity-copy cell-3-6 cap-1)
(cell-capacity cell-1-1 cap-2)
(cell-capacity cell-0-6 cap-4)
(node-degree0-copy n-1-6)
(cell-capacity-copy cell-0-2 cap-4)
(unlock-origin-domain )
(cell-capacity-copy cell-0-3 cap-2)
(node-degree0 n-0-1)
(cell-edge-copy cell-1-0 cell-1-1 n-1-1 n-2-1)
(cell-edge cell-3-2 cell-outside-2-down n-4-2 n-4-3)
(node-degree0 n-2-4)
(node-degree0 n-3-0)
(cell-capacity-copy cell-2-1 cap-4)
(cell-capacity-copy cell-0-4 cap-4)
(cell-capacity cell-1-2 cap-2)
(cell-capacity-copy cell-outside-7-up cap-1)
(cell-capacity cell-outside-3-up cap-1)
(node-degree0 n-2-8)
(cell-edge-copy cell-3-5 cell-3-6 n-3-6 n-4-6)
(cell-capacity cell-3-3 cap-4)
(cell-edge-copy cell-1-2 cell-2-2 n-2-2 n-2-3)
(cell-edge cell-1-5 cell-2-5 n-2-5 n-2-6)
(cell-edge cell-1-0 cell-1-1 n-1-1 n-2-1)
(node-degree0-copy n-3-5)
(node-degree0-copy n-0-2)
(cell-capacity-copy cell-1-1 cap-2)
(node-degree0-copy n-3-8)
(cell-capacity-copy cell-0-6 cap-4)
(cell-edge-copy cell-0-4 cell-0-5 n-0-5 n-1-5)
(cell-edge cell-1-6 cell-1-7 n-1-7 n-2-7)
(node-degree0-copy n-0-0)
(node-degree0-copy n-1-8)
(cell-edge-copy cell-2-7 cell-3-7 n-3-7 n-3-8)
(node-degree0-copy n-2-1)
(cell-capacity cell-outside-2-up cap-1)
(cell-capacity-inc cap-0 cap-1)
(cell-capacity cell-outside-5-down cap-1)
(node-degree0-copy n-2-6)
(cell-capacity-copy cell-1-2 cap-2)
(cell-capacity cell-2-0 cap-4)
(cell-edge-copy cell-outside-6-up cell-0-6 n-0-6 n-0-7)
(cell-edge-copy cell-3-0 cell-outside-0-down n-4-0 n-4-1)
(cell-capacity-copy cell-outside-3-up cap-1)
(cell-edge cell-0-7 cell-outside-0-right n-0-8 n-1-8)
(cell-capacity-copy cell-3-3 cap-4)
(cell-edge cell-0-2 cell-0-3 n-0-3 n-1-3)
(cell-edge-copy cell-3-3 cell-3-4 n-3-4 n-4-4)
(cell-capacity-inc-copy cap-0 cap-1)
(cell-edge-copy cell-0-6 cell-0-7 n-0-7 n-1-7)
(cell-edge-copy cell-3-4 cell-3-5 n-3-5 n-4-5)
(node-degree0 n-0-3)
(cell-edge-copy cell-1-1 cell-1-2 n-1-2 n-2-2)
(cell-edge-copy cell-3-2 cell-3-3 n-3-3 n-4-3)
(node-degree0-copy n-1-0)
(cell-edge-copy cell-2-0 cell-3-0 n-3-0 n-3-1)
(node-degree0 n-3-4)
(cell-edge-copy cell-outside-2-left cell-2-0 n-2-0 n-3-0)
(cell-edge cell-3-3 cell-outside-3-down n-4-3 n-4-4)
(cell-edge cell-3-0 cell-outside-0-down n-4-0 n-4-1)
(cell-capacity cell-outside-0-left cap-1)
(node-degree0-copy n-3-1)
(cell-edge cell-1-4 cell-2-4 n-2-4 n-2-5)
(cell-capacity-copy cell-outside-2-up cap-1)
(cell-capacity-copy cell-outside-5-down cap-1)
(cell-edge cell-outside-5-up cell-0-5 n-0-5 n-0-6)
(cell-edge cell-1-0 cell-2-0 n-2-0 n-2-1)
(cell-capacity-copy cell-0-5 cap-1)
(cell-capacity cell-1-4 cap-4)
(cell-capacity-copy cell-2-0 cap-4)
(cell-edge cell-0-3 cell-1-3 n-1-3 n-1-4)
(cell-edge-copy cell-2-1 cell-3-1 n-3-1 n-3-2)
(node-degree0-copy n-1-3)
(node-degree0 n-1-2)
(cell-edge cell-outside-2-left cell-2-0 n-2-0 n-3-0)
(cell-capacity cell-outside-6-up cap-1)
(node-degree0-copy n-4-1)
(node-degree0 n-4-6)
(node-degree0-copy n-3-3)
(cell-capacity cell-outside-4-down cap-1)
(node-degree0 n-3-6)
(cell-capacity-copy cell-outside-0-left cap-1)
(cell-capacity cell-outside-2-left cap-1)
(cell-edge-copy cell-3-0 cell-3-1 n-3-1 n-4-1)
(cell-edge-copy cell-3-7 cell-outside-3-right n-3-8 n-4-8)
(cell-capacity-copy cell-1-4 cap-4)
(cell-edge cell-1-3 cell-1-4 n-1-4 n-2-4)
(cell-capacity cell-0-7 cap-4)
(cell-capacity-copy cell-1-6 cap-4)
(node-degree0-copy n-0-8)
(cell-capacity-copy cell-outside-6-up cap-1)
(node-degree0-copy n-2-8)
(cell-edge cell-2-5 cell-3-5 n-3-5 n-3-6)
(node-degree0-copy n-4-3)
(cell-capacity cell-1-5 cap-2)
(cell-edge-copy cell-3-6 cell-outside-6-down n-4-6 n-4-7)
(cell-edge cell-outside-3-left cell-3-0 n-3-0 n-4-0)
(cell-edge cell-outside-0-left cell-0-0 n-0-0 n-1-0)
(cell-capacity cell-0-0 cap-2)
(cell-capacity-copy cell-outside-4-down cap-1)
(node-degree0 n-2-3)
(cell-capacity-inc cap-2 cap-3)
(cell-edge-copy cell-1-6 cell-2-6 n-2-6 n-2-7)
(node-degree0 n-1-5)
(cell-edge-copy cell-0-1 cell-0-2 n-0-2 n-1-2)
(cell-edge cell-3-6 cell-3-7 n-3-7 n-4-7)
(cell-edge cell-3-6 cell-outside-6-down n-4-6 n-4-7)
(node-degree0 n-1-1)
(cell-capacity-copy cell-0-7 cap-4)
(cell-edge-copy cell-1-5 cell-2-5 n-2-5 n-2-6)
(cell-edge-copy cell-2-1 cell-2-2 n-2-2 n-3-2)
(cell-edge cell-3-7 cell-outside-7-down n-4-7 n-4-8)
(node-degree0-copy n-4-2)
(cell-capacity-inc-copy cap-2 cap-3)
(cell-edge cell-2-7 cell-outside-2-right n-2-8 n-3-8)
(cell-capacity-copy cell-1-5 cap-2)
(cell-capacity cell-outside-6-down cap-1)
(node-degree0-copy n-2-5)
(cell-edge-copy cell-1-6 cell-1-7 n-1-7 n-2-7)
(cell-capacity-copy cell-0-0 cap-2)
(cell-capacity cell-outside-3-down cap-1)
(cell-edge cell-1-6 cell-2-6 n-2-6 n-2-7)
(node-degree0 n-3-2)
(node-degree0 n-0-4)
(cell-edge cell-0-1 cell-0-2 n-0-2 n-1-2)
(cell-capacity cell-2-3 cap-4)
(cell-edge cell-2-1 cell-2-2 n-2-2 n-3-2)
(cell-edge cell-0-3 cell-0-4 n-0-4 n-1-4)
(cell-edge-copy cell-0-7 cell-outside-0-right n-0-8 n-1-8)
(cell-edge cell-2-6 cell-3-6 n-3-6 n-3-7)
(node-degree0-copy n-0-6)
(cell-edge-copy cell-0-2 cell-0-3 n-0-3 n-1-3)
(node-degree0-copy n-4-4)
(cell-edge cell-3-5 cell-outside-5-down n-4-5 n-4-6)
(cell-edge cell-2-6 cell-2-7 n-2-7 n-3-7)
(cell-edge cell-1-7 cell-outside-1-right n-1-8 n-2-8)
(cell-capacity cell-1-3 cap-1)
(cell-capacity-inc cap-3 cap-4)
(cell-edge-copy cell-3-3 cell-outside-3-down n-4-3 n-4-4)
(cell-capacity-copy cell-outside-6-down cap-1)
(cell-capacity cell-outside-0-right cap-1)
(cell-capacity-copy cell-outside-3-down cap-1)
(cell-capacity cell-2-6 cap-4)
(node-degree0 n-0-5)
(cell-edge cell-2-5 cell-2-6 n-2-6 n-3-6)
(cell-edge-copy cell-1-4 cell-2-4 n-2-4 n-2-5)
(node-degree0-copy n-1-7)
(node-degree0-copy n-4-6)
(cell-edge-copy cell-1-7 cell-2-7 n-2-7 n-2-8)
(node-degree0-copy n-4-0)
(cell-edge-copy cell-outside-5-up cell-0-5 n-0-5 n-0-6)
(cell-edge-copy cell-1-0 cell-2-0 n-2-0 n-2-1)
(cell-capacity-copy cell-2-3 cap-4)
(node-degree0-copy n-3-7)
(cell-edge-copy cell-0-3 cell-1-3 n-1-3 n-1-4)
(cell-edge-copy cell-2-4 cell-3-4 n-3-4 n-3-5)
(node-degree0 n-1-6)
(node-degree0-copy n-2-0)
(node-degree0-copy n-0-7)
(cell-edge cell-3-1 cell-outside-1-down n-4-1 n-4-2)
(cell-capacity cell-3-7 cap-3)
(cell-edge cell-0-5 cell-0-6 n-0-6 n-1-6)
(cell-edge cell-1-7 cell-2-7 n-2-7 n-2-8)
(node-degree0-copy n-2-2)
(cell-capacity-copy cell-1-3 cap-1)
(cell-edge cell-outside-7-up cell-0-7 n-0-7 n-0-8)
(cell-edge cell-2-4 cell-3-4 n-3-4 n-3-5)
(cell-capacity-copy cell-outside-0-right cap-1)
(cell-edge cell-2-0 cell-2-1 n-2-1 n-3-1)
(cell-capacity-copy cell-2-6 cap-4)
(node-degree0 n-3-5)
(node-degree0 n-0-2)
(cell-edge cell-1-4 cell-1-5 n-1-5 n-2-5)
(cell-capacity cell-outside-1-right cap-1)
(node-degree0 n-3-8)
(cell-edge-copy cell-2-4 cell-2-5 n-2-5 n-3-5)
(cell-edge-copy cell-1-3 cell-1-4 n-1-4 n-2-4)
(cell-edge cell-3-1 cell-3-2 n-3-2 n-4-2)
(cell-edge cell-1-3 cell-2-3 n-2-3 n-2-4)
(cell-capacity cell-outside-0-down cap-1)
(node-degree0-copy n-4-8)
(cell-capacity cell-outside-1-down cap-1)
(node-degree0-copy n-4-7)
(node-degree0-copy n-2-7)
(cell-capacity-copy cell-3-7 cap-3)
(node-degree0 n-0-0)
(cell-edge-copy cell-2-5 cell-3-5 n-3-5 n-3-6)
(node-degree0 n-1-8)
(cell-edge cell-2-2 cell-3-2 n-3-2 n-3-3)
(node-degree0-copy n-2-3)
(cell-capacity cell-2-2 cap-3)
(node-degree0 n-2-1)
(cell-edge-copy cell-outside-1-up cell-0-1 n-0-1 n-0-2)
(cell-edge-copy cell-outside-3-left cell-3-0 n-3-0 n-4-0)
(cell-edge-copy cell-outside-0-left cell-0-0 n-0-0 n-1-0)
(cell-capacity cell-3-4 cap-4)
(cell-capacity cell-1-0 cap-2)
(node-degree0-copy n-0-1)
(cell-edge cell-2-4 cell-2-5 n-2-5 n-3-5)
(node-degree0-copy n-2-4)
(node-degree0 n-1-4)
(node-degree0-copy n-3-0)
(cell-edge cell-2-2 cell-2-3 n-2-3 n-3-3)
(cell-edge cell-0-7 cell-1-7 n-1-7 n-1-8)
(cell-edge cell-1-5 cell-1-6 n-1-6 n-2-6)
(node-degree0 n-1-0)
(node-degree0-copy n-3-2)
(cell-edge-copy cell-3-6 cell-3-7 n-3-7 n-4-7)
(cell-capacity-copy cell-outside-0-down cap-1)
(cell-edge cell-outside-1-up cell-0-1 n-0-1 n-0-2)
(cell-edge-copy cell-0-6 cell-1-6 n-1-6 n-1-7)
(cell-edge cell-2-3 cell-2-4 n-2-4 n-3-4)
(cell-capacity-copy cell-outside-1-down cap-1)
(cell-edge-copy cell-3-7 cell-outside-7-down n-4-7 n-4-8)
(node-degree0 n-3-1)
(cell-edge-copy cell-2-7 cell-outside-2-right n-2-8 n-3-8)
(cell-capacity-copy cell-2-2 cap-3)
(cell-edge-copy cell-3-4 cell-outside-4-down n-4-4 n-4-5)
(cell-capacity-copy cell-outside-2-left cap-1)
(cell-capacity cell-0-3 cap-2)
(cell-edge cell-0-5 cell-1-5 n-1-5 n-1-6)
(cell-capacity-copy cell-3-4 cap-4)
(cell-capacity-copy cell-1-0 cap-2)
(cell-capacity cell-outside-2-down cap-1)
(node-degree0 n-1-3)
(cell-capacity cell-1-7 cap-2)
(cell-edge cell-0-6 cell-1-6 n-1-6 n-1-7)
(cell-edge-copy cell-0-3 cell-0-4 n-0-4 n-1-4)
(node-degree0 n-4-5)
(cell-edge cell-1-1 cell-2-1 n-2-1 n-2-2)
(cell-edge-copy cell-2-6 cell-3-6 n-3-6 n-3-7)
(node-degree0 n-4-1)
(cell-edge-copy cell-0-4 cell-1-4 n-1-4 n-1-5)
(cell-edge cell-outside-1-left cell-1-0 n-1-0 n-2-0)
(node-degree0 n-3-3)
(cell-edge-copy cell-1-2 cell-1-3 n-1-3 n-2-3)
(cell-edge cell-3-4 cell-outside-4-down n-4-4 n-4-5)
(cell-capacity cell-outside-5-up cap-1)
(cell-edge cell-0-0 cell-0-1 n-0-1 n-1-1)
(cell-edge-copy cell-3-5 cell-outside-5-down n-4-5 n-4-6)
(cell-edge cell-2-3 cell-3-3 n-3-3 n-3-4)
(cell-edge-copy cell-2-6 cell-2-7 n-2-7 n-3-7)
(cell-edge-copy cell-1-7 cell-outside-1-right n-1-8 n-2-8)
(node-degree0-copy n-0-3)
(node-degree0-copy n-3-4)
(cell-edge cell-outside-0-up cell-0-0 n-0-0 n-0-1)
(cell-capacity-copy cell-outside-2-down cap-1)
(cell-edge-copy cell-2-5 cell-2-6 n-2-6 n-3-6)
(cell-edge cell-0-4 cell-1-4 n-1-4 n-1-5)
(node-degree0 n-0-8)
(cell-edge cell-1-2 cell-1-3 n-1-3 n-2-3)
(cell-capacity-copy cell-1-7 cap-2)
(cell-capacity cell-2-4 cap-4)
(cell-capacity cell-0-1 cap-4)
(node-degree0 n-4-3)
(cell-capacity cell-3-0 cap-4)
(cell-edge-copy cell-3-1 cell-outside-1-down n-4-1 n-4-2)
(node-degree0-copy n-1-2)
(cell-capacity-copy cell-outside-5-up cap-1)
(cell-capacity cell-outside-4-up cap-1)
(cell-capacity cell-2-7 cap-4)
(cell-edge-copy cell-0-5 cell-0-6 n-0-6 n-1-6))                        (:goal (and
		(not (node-degree1 n-0-0))
		(not (node-degree1 n-0-1))
		(not (node-degree1 n-0-2))
		(not (node-degree1 n-0-3))
		(not (node-degree1 n-0-4))
		(not (node-degree1 n-0-5))
		(not (node-degree1 n-0-6))
		(not (node-degree1 n-0-7))
		(not (node-degree1 n-0-8))
		(not (node-degree1 n-1-0))
		(not (node-degree1 n-1-1))
		(not (node-degree1 n-1-2))
		(not (node-degree1 n-1-3))
		(not (node-degree1 n-1-4))
		(not (node-degree1 n-1-5))
		(not (node-degree1 n-1-6))
		(not (node-degree1 n-1-7))
		(not (node-degree1 n-1-8))
		(not (node-degree1 n-2-0))
		(not (node-degree1 n-2-1))
		(not (node-degree1 n-2-2))
		(not (node-degree1 n-2-3))
		(not (node-degree1 n-2-4))
		(not (node-degree1 n-2-5))
		(not (node-degree1 n-2-6))
		(not (node-degree1 n-2-7))
		(not (node-degree1 n-2-8))
		(not (node-degree1 n-3-0))
		(not (node-degree1 n-3-1))
		(not (node-degree1 n-3-2))
		(not (node-degree1 n-3-3))
		(not (node-degree1 n-3-4))
		(not (node-degree1 n-3-5))
		(not (node-degree1 n-3-6))
		(not (node-degree1 n-3-7))
		(not (node-degree1 n-3-8))
		(not (node-degree1 n-4-0))
		(not (node-degree1 n-4-1))
		(not (node-degree1 n-4-2))
		(not (node-degree1 n-4-3))
		(not (node-degree1 n-4-4))
		(not (node-degree1 n-4-5))
		(not (node-degree1 n-4-6))
		(not (node-degree1 n-4-7))
		(not (node-degree1 n-4-8))
		(cell-capacity cell-0-0 cap-0)
		(cell-capacity cell-0-3 cap-0)
		(cell-capacity cell-0-5 cap-0)
		(cell-capacity cell-1-0 cap-0)
		(cell-capacity cell-1-1 cap-0)
		(cell-capacity cell-1-2 cap-0)
		(cell-capacity cell-1-3 cap-0)
		(cell-capacity cell-1-5 cap-0)
		(cell-capacity cell-1-7 cap-0)
		(cell-capacity cell-2-2 cap-0)
		(cell-capacity cell-3-2 cap-0)
		(cell-capacity cell-3-5 cap-0)
		(cell-capacity cell-3-6 cap-0)
		(cell-capacity cell-3-7 cap-0)
		(invalid )))                        )