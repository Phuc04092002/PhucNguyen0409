using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class FirstBox : MonoBehaviour
{
        public Transform GhostBox;
        public float speed = 5f; // Tốc độ di chuyển
    private bool isMoving = false; //Kiểm tra xem có đang di chuyển không

    // Start is called before the first frame update
    void Start()
    {
        // if(transform.position != GhostBox.position){
            StartCoroutine(MoveToMainBox());
        // }
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
    }
}