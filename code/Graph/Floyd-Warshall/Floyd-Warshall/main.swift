//
//  main.swift
//  Floyd-Warshall
//
//  Created by 王锡金 on 2019/9/19.
//  Copyright © 2019 seeking. All rights reserved.
//

import Foundation

// 通过标准输入动态初始化数据
print("\n请输入顶点个数，按回车输入结束：")
var vertexInput = String(data: FileHandle.standardInput.availableData, encoding: String.Encoding.utf8)
print("\n请输入边的个数，按回车输入结束：")
var edgeInput = String(data: FileHandle.standardInput.availableData, encoding: String.Encoding.utf8)

if let vertexCountInput = vertexInput , let edgeCountInput = edgeInput {
    
    // 处理标准输入的顶点、边数信息
    var endIndex = vertexCountInput.index(vertexCountInput.endIndex, offsetBy: -1)
    let vertexCount = Int(vertexCountInput[vertexCountInput.startIndex..<endIndex])
    endIndex = edgeCountInput.index(edgeCountInput.endIndex, offsetBy: -1)
    let edgeCount = Int(edgeCountInput[edgeCountInput.startIndex..<endIndex])
    
    if let newVertexCount = vertexCount , let newEdgeCount = edgeCount  {
        
        // 初始化一个邻接矩阵
        var graph = Array2D(columns: newVertexCount, rows: newVertexCount, initialValue: INF)
        var edgeIndex:Int = 0
        while edgeIndex < newEdgeCount
        {
            /* 样例数据
             graph[0,1] = 2
             graph[0,2] = 6
             graph[0,3] = 4
             graph[1,2] = 3
             graph[2,0] = 7
             graph[2,3] = 1
             graph[3,0] = 5
             graph[3,2] = 12
             */
            
            print("\n请输入分别输入边的起始点、终止点、长度，以空格分隔，按回车输入结束：")
            let edgeInput = String(data: FileHandle.standardInput.availableData, encoding: String.Encoding.utf8)
            if let newEdgeInput = edgeInput {
                let data = newEdgeInput.split(separator: " ")
                if data.count >= 3 {
                    
                    // 分别取出输入的起点、终点、边长度字符串
                    let startIndexString = data[0]
                    let endIndexString = data[1]
                    var edgeValueString = data[2]
                    
                    // 删除边长度后面的换行符
                    let edgeValueEndIndex = edgeValueString.index(edgeValueString.endIndex, offsetBy: -1)
                    edgeValueString = edgeValueString[edgeValueString.startIndex..<edgeValueEndIndex]
                    
                    // 删除字符串两侧的空格
                    let formateStartIndexString = startIndexString.trimmingCharacters(in: .whitespaces)
                    let formateEndIndexString = endIndexString.trimmingCharacters(in: .whitespaces)
                    let formateEdgeValueString = edgeValueString.trimmingCharacters(in: .whitespaces)
                    
                    // 格式化为数值类型
                    let startIndex = Int(formateStartIndexString)
                    let endIndex = Int(formateEndIndexString)
                    let edgeValue = Int(formateEdgeValueString)
                    
                    // 进行输入格式的判断
                    if let i = startIndex,let j = endIndex,let v = edgeValue {
                        if i < 0 || j < 0 || i >= newVertexCount || j >= newVertexCount  {
                            print("\n边的起始点、终止点输入有误")
                            continue
                        }
                        else if i == j  {
                            print("\n边的起始点、终止点相同，不需要输入长度")
                            continue
                        }
                        else { // 输入无误后填入邻接矩阵
                            graph[i,j] = v
                            edgeIndex += 1
                        }
                    }
                    else {
                        print("边信息输入有误，请重新输入：")
                    }
                }
                else {
                    print("边信息输入有误，请重新输入：")
                }
            }
        }
        
        let floyd = Floyd(graph: graph)
        // 计算所有最短路径
        floyd.allShortestPath()
        // 打印所有最短路径
        floyd.printGraph()
    }
}



