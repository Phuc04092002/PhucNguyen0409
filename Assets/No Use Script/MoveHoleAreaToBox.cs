using System.Collections;
using System.Collections.Generic;
using UnityEngine;

//public enum ScrerState
//{
//    None,
//    Hole,
//    Box
//}


public class MoveHoleAreaToBox : MonoBehaviour
{
    public LayerMask layerMask; // Layer chỉ định cho ốc vít

    public Transform targetObject;
    public Transform targetObject2;
    public Transform targetObject3;

    public Transform HoleArea;
    public Transform HoleArea2;
    public Transform HoleArea3;
    public Transform HoleArea4;
    public Transform HoleArea5;
    public Transform HoleArea6;
    public Transform HoleArea7;

    private bool targetOccupied = false;
    private bool target2Occupied = false;
    private bool target3Occupied = false;

    public float speed = 5f; // Tốc độ di chuyển
    private bool isMoving = false; //Kiểm tra xem có đang di chuyển không
    // Start is called before the first frame update


    public void Update()
    {
        SpriteRenderer spriteRenderer = GetComponent<SpriteRenderer>();
        string objectHexColor = ColorUtility.ToHtmlStringRGB(spriteRenderer.color);
        GameObject objectC = GameObject.FindWithTag("Box");
        SpriteRenderer targetSpriteRenderer = objectC.GetComponent<SpriteRenderer>();
        string targetHexColor = ColorUtility.ToHtmlStringRGB(targetSpriteRenderer.color);

        Vector2 checkPosition = targetObject.position;
        Vector2 checkPosition2 = targetObject2.position;
        Vector2 checkPosition3 = targetObject3.position;

        if ( transform.position == HoleArea.position || transform.position == HoleArea2.position || transform.position == HoleArea3.position ||transform.position == HoleArea4.position ||transform.position == HoleArea5.position || transform.position == HoleArea6.position || transform.position == HoleArea7.position)
        {
             if (objectHexColor.Equals(targetHexColor)) //Kiểm tra màu bằng Hexdecimal
             {
                transform.SetParent(objectC.transform, true);
                Collider2D collider = Physics2D.OverlapPoint(checkPosition, layerMask); //Kiểm tra va chạm ở lỗ vít

                if (collider == null && !targetOccupied)
                {
                    targetOccupied = true;
                    StartCoroutine(MoveToTarget()); // Gọi coroutine di chuyển đến lỗ khóa
                    
                }
        else {
                    Collider2D collider2 = Physics2D.OverlapPoint(checkPosition2, layerMask);
                    if (collider2 == null && !target2Occupied && !targetOccupied)
                    {
                        target2Occupied = true;
                        StartCoroutine(MoveToTarget2());
                        
                    }
            else {
                        Collider2D collider3 = Physics2D.OverlapPoint(checkPosition3, layerMask);
                        if (collider3 == null && !target3Occupied && !target2Occupied && !targetOccupied)
                        {
                            target3Occupied = true;
                            StartCoroutine(MoveToTarget3());
                            
                        }
            }
        }
    }
        }
    }
    private IEnumerator MoveToTarget()
    {
        isMoving = true; 

        while (Vector3.Distance(transform.position, targetObject.position) > 0.01f)
        {
            Vector3 direction = (targetObject.position - transform.position).normalized;

            transform.Translate(direction * speed * Time.deltaTime, Space.World);

            yield return null;
        }
        transform.position = targetObject.position;

        isMoving = false;
    }
    // Di chuyển liên tục đến lỗ 2
    private IEnumerator MoveToTarget2()
    {
        isMoving = true; 

        while (Vector3.Distance(transform.position, targetObject2.position) > 0.01f)
        {
            Vector3 direction = (targetObject2.position - transform.position).normalized;

            transform.Translate(direction * speed * Time.deltaTime, Space.World);

            yield return null;
        }
        transform.position = targetObject2.position;

        isMoving = false;
    }
    // Di chuyển liên tục đến lỗ 3
    private IEnumerator MoveToTarget3()
    {
        isMoving = true; 

        while (Vector3.Distance(transform.position, targetObject3.position) > 0.01f)
        {
            Vector3 direction = (targetObject3.position - transform.position).normalized;

            transform.Translate(direction * speed * Time.deltaTime, Space.World);

            yield return null;
        }
        transform.position = targetObject3.position;

        isMoving = false;
        // Gọi hàm của BoxCover
        GameObject BoxCover = GameObject.FindWithTag("BoxCover");
        BoxCoverMove scriptBoxCover = BoxCover.GetComponent<BoxCoverMove>();
        scriptBoxCover.Move();
    }
}
