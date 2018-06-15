//
//  ViewController.swift
//  World Tracking
//
//  Created by Julian Lechuga Lopez on 11/6/18.
//  Copyright © 2018 Julian Lechuga Lopez. All rights reserved.
//

import UIKit
import ARKit
class ViewController: UIViewController {
    
    @IBOutlet weak var sceneView: ARSCNView!
    let configuration = ARWorldTrackingConfiguration()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints,ARSCNDebugOptions.showWorldOrigin]
        self.sceneView.session.run(configuration)
        self.sceneView.autoenablesDefaultLighting = true
        // Do any additional setup after loading the view, typically from a nib.
    }


    
    @IBAction func add(_ sender: Any) {
        let plane = SCNNode(geometry: SCNPlane(width: 0.1, height: 0.1))
        plane.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
        plane.position = SCNVector3(0,0,-0.3)
        plane.eulerAngles = SCNVector3(270.degreesToRadians,0,0)
        self.sceneView.scene.rootNode.addChildNode(plane)
        
        let pyramid = SCNNode(geometry: SCNPyramid(width: 0.1, height: 0.1, length: 0.1))
        pyramid.geometry?.firstMaterial?.diffuse.contents = UIColor.red
        pyramid.position = SCNVector3(0,0,-0.3)
        pyramid.eulerAngles = SCNVector3(90.degreesToRadians,0,0)
        plane.addChildNode(pyramid)
//        let node = SCNNode()
//
//        let boxNode = SCNNode(geometry: SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0))
//        boxNode.geometry?.firstMaterial?.diffuse.contents = UIColor.yellow
//
//        let doorNode = SCNNode(geometry: SCNPlane(width: 0.03, height: 0.06))
//        doorNode.geometry?.firstMaterial?.diffuse.contents = UIColor.brown
        
//        Standard 3D geometry
//        node.geometry = SCNCapsule(capRadius: 0.1, height: 0.3)
//        node.geometry = SCNCone(topRadius: 0.1, bottomRadius: 0.1, height: 0.5)
//        node.geometry = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius:0.03)
//        node.geometry = SCNSphere(radius: 0.1)
//        node.geometry = SCNTube(innerRadius: 0.1, outerRadius: 0.2, height: 0.3)
//        node.geometry = SCNTorus(ringRadius: 0.5, pipeRadius: 0.2)
//        node.geometry = SCNPlane(width: 0.2, height: 0.2)
//        node.geometry = SCNPyramid(width: 0.1, height: 0.1, length: 0.1)
        
//        let path = UIBezierPath()
//        path.move(to: CGPoint(x:0,y:0))
//        path.addLine(to: CGPoint(x:0, y:0.2))
//        path.addLine(to: CGPoint(x:0.2, y:0.3))
//        path.addLine(to: CGPoint(x:0.4, y:0.2))
//        path.addLine(to: CGPoint(x:0.4, y:0))
//        let shape = SCNShape(path: path, extrusionDepth:0.05)
//        node.geometry = shape
//        node.geometry = SCNPyramid(width: 0.1, height: 0.1, length: 0.1)
//        node.geometry?.firstMaterial?.specular.contents = UIColor.white
//        node.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
//        let x = randomNumbers(firstNum: -0.3, secondNum: 0.3)
//        let y = randomNumbers(firstNum: -0.3, secondNum: 0.3)
//        let z = randomNumbers(firstNum: -0.3, secondNum: 0.3)

//        node.position = SCNVector3(0.2,0.1,-0.2)
//        boxNode.position = SCNVector3(0,-0.05,0)
//        doorNode.position = SCNVector3(0,-0.02,0.055)
//        node.addChildNode(boxNode)
//        boxNode.addChildNode(doorNode)
//        self.sceneView.scene.rootNode.addChildNode(node)

    }
    
    @IBAction func reset(_ sender: Any) {
        self.restartSession()
    }
    
    func restartSession(){
        self.sceneView.session.pause()
        self.sceneView.scene.rootNode.enumerateChildNodes{(node, _) in
            node.removeFromParentNode()
        }
        self.sceneView.session.run(configuration, options:
            [.resetTracking, .removeExistingAnchors] )
    }
    
    func randomNumbers(firstNum: CGFloat, secondNum: CGFloat) -> CGFloat{
        return CGFloat(arc4random()) / CGFloat(UINT32_MAX) * abs(firstNum - secondNum) +
            min(firstNum,secondNum)
    }
    
}

extension Int{
    
    var degreesToRadians: Double { return Double(self) * .pi/180}
}

