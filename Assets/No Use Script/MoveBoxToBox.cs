using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MoveBoxToBox : MonoBehaviour
{
    public string targetTag = "FullBox";
    public string targetChildTag = "Box";
    public string targetCoverTag = "BoxCover";
    public GameObject childObject;
    public GameObject CoverObject;
    public string NameBox;
    public Transform GhostBox;
    public Transform GhostBox2;   
    public float speed = 5f; // Tốc độ di chuyển
    private bool isMoving = false; //Kiểm tra xem có đang di chuyển không

    // Update is called once per frame
    public void MainBox()
    {
        if(transform.position != GhostBox.position){
            GameObject CBox = GameObject.Find(NameBox);

            StartCoroutine(MoveToMainBox());
            if(CBox!=null){
            MoveBoxToBox scriptNextBox = CBox.GetComponent<MoveBoxToBox>();
            scriptNextBox.NextBox();
            }
        }
    }
    private IEnumerator MoveToMainBox()
    {
        isMoving = true; 

        while (Vector3.Distance(transform.position, GhostBox.position) > 0.01f)
        {
            Vector3 direction = (GhostBox.position - transform.position).normalized;

            transform.Translate(direction * speed * Time.deltaTime, Space.World);

            yield return null;
        }
        transform.position = GhostBox.position;

        isMoving = false;

        gameObject.tag = targetTag;
        childObject.tag = targetChildTag;
        CoverObject.tag = targetCoverTag;
        GameObject Screw = GameObject.FindGameObjectWithTag("Screw");
        if (Screw != null)
        {
            MoveHoleAreaToBox ScrewInHole = Screw.GetComponent<MoveHoleAreaToBox>();
            //ScrewInHole.Update();

        }
    }



    public void NextBox(){
        if(transform.position != GhostBox2.position){
            StartCoroutine(MoveToNextBox());
        }
    }
private IEnumerator MoveToNextBox()
    {
        isMoving = true; 

        while (Vector3.Distance(transform.position, GhostBox2.position) > 0.01f)
        {
            Vector3 direction = (GhostBox2.position - transform.position).normalized;

            transform.Translate(direction * speed * Time.deltaTime, Space.World);

            yield return null;
        }
        transform.position = GhostBox2.position;

        isMoving = false;
    }

}
